HtmlWebpackPlugin = require('html-webpack-plugin')
ExtractTextPlugin = require("extract-text-webpack-plugin")
path = require('path')

output = "public"


module.exports = function makeWebpackConfig() {
    config = {}
    config.entry = "./app/entry.coffee"
    config.output = {
	path: path.resolve(__dirname, output),
	filename: "bundle.js"
    }
    config.module = {
	loaders: [
	    { test: /\.css$/, loader: "style-loader!css-loader"},
	    { test: /\.coffee$/, loader: "coffee-loader"},
	    { test: /\.pug/, loader: ['html-loader', 'pug-html-loader']},
	    { test: /\.(eot|svg|ttf|woff(2)?)(\?v=\d+\.\d+\.\d+)?/, loader: "file-loader"}
	]
    }
    config.plugins = [
	new HtmlWebpackPlugin({
	    template: './app/index.pug',
	    filetype: 'pug',
	    title: "My App"
	})
	,new ExtractTextPlugin("styles.css")
    ]
    return config
}

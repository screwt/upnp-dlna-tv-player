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
    config.externals = {
	"@achingbrain/ssdp":"require('@achingbrain/ssdp')",
	"node-ssdp" : "require('node-ssdp')"
    }
    config.module = {
	loaders: [
	    { test: /\.css$/, loader: "style-loader!css-loader"},
	    {
		test: /\.coffee$/,
		exclude: path.resolve(__dirname,"node_modules","@achingbrain","ssd"),
		loader: "coffee-loader"},
	    { test: /\.pug/, loader: ['html-loader', 'pug-html-loader']},
	    { test: /\.(eot|svg|ttf|woff(2)?)(\?v=\d+\.\d+\.\d+)?/, loader: "file-loader"},
	    { test: /\.xml/, loader: ['raw-loader']}
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

const path = require('path');
const {CleanWebpackPlugin} = require('clean-webpack-plugin');
const HTMLWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    context: path.resolve(__dirname, 'src'),
    mode: 'development',
    // entry: './src/index.js',
    entry: {
        main: './index.js',
        analytics: './analytic.js'
    },
    output: {
        // filename: 'bundle.js',
        filename: '[name].[contenthash].bundle.js',
        path: path.resolve(__dirname, 'dist')
    },
    plugins: [
        new HTMLWebpackPlugin({
            filename: 'index.html',
            title: 'Webpack!!!!',
            template: './index.html'
        }), 
        new CleanWebpackPlugin(),
    ]
}
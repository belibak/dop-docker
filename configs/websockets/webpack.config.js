var path = require('path');
var webpack = require('webpack');
var BundleTracker = require('webpack-bundle-tracker');

var PROD_ENV = process.env.PROD_ENV;
var ENTRY = process.env.ENTRY;

var plugins = [];

switch(PROD_ENV) {
    case '1':
        plugins = [
            new webpack.optimize.OccurrenceOrderPlugin(),
            new webpack.optimize.DedupePlugin(),
            new webpack.optimize.AggressiveMergingPlugin(),
            new webpack.DefinePlugin({
                'process.env': {
                    'NODE_ENV': JSON.stringify('production')
                },
                'SOCKET_IP': null,
            }),
            new webpack.optimize.UglifyJsPlugin({
                minimize: true,
                compress: {
                    warnings: false
                }
            }),
            new BundleTracker({filename: './build/webpack-stats.json'})
        ];
        break;
    case '2':
        plugins = [
            new webpack.optimize.OccurrenceOrderPlugin(),
            new webpack.optimize.DedupePlugin(),
            new webpack.optimize.AggressiveMergingPlugin(),
            new webpack.DefinePlugin({
                'process.env': {
                    'NODE_ENV': JSON.stringify('production')
                },
                'SOCKET_IP': JSON.stringify('amazon-ringlead.tk'),
            }),
            new webpack.optimize.UglifyJsPlugin({
                minimize: true,
                compress: {
                    warnings: false
                },
            }),
            new BundleTracker({filename: './build/webpack-stats.json'})
        ];
        break;
    default:
        plugins = [
            new webpack.optimize.OccurrenceOrderPlugin(),
            new webpack.optimize.DedupePlugin(),
            new webpack.optimize.AggressiveMergingPlugin(),
            new webpack.DefinePlugin({
                'process.env': {
                    'NODE_ENV': JSON.stringify('development')
                },
                'SOCKET_IP': null,
            }),
            new BundleTracker({filename: './build/webpack-stats.json'})
        ];
}

module.exports = {
    entry: ENTRY,
    output: {path: __dirname, filename: 'build/build.js', publicPath: '/'},
    devtool: 'source-map',
    plugins: plugins,
    module: {
        loaders: [
            {
                test: /.jsx?$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                plugins: ['transform-runtime'],
                query: {
                    presets: ['es2015', 'react']
                }
            }
        ]
    },
};

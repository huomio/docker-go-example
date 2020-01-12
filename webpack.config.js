const HtmlWebPackPlugin = require("html-webpack-plugin");
module.exports = {
    entry: "./web/scripts.js",
    module: {

        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        "presets": ["@babel/preset-env", "@babel/preset-react"],
                    },
                },

            }
        ]
    },
    plugins: [
        new HtmlWebPackPlugin({
            template: "./web/index.html",
            filename: "./index.html"
        })
    ]
}
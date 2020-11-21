const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

//$: 'jquery',

//jQuery: 'jquery',

//Popper: ['popper.js', 'default']

$: 'jquery/src/jquery',
jQuery: 'jquery/src/jquery'

}))
module.exports = environment

const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const config = environment.toWebpackConfig();

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
)

config.resolve.alias = {
    jquery: "jquery/src/jquery",
};

module.exports = environment
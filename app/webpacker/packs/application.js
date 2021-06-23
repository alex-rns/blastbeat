// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/webpacker and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels")
require("bootstrap")
window.$ = require("jquery")

const images = require.context("../src/images", true)
const imagePath = (name) => images(name, true)
window.imagePath = imagePath

import "stylesheets/application"
import "javascripts/products/form"

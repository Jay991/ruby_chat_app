// app/javascript/controllers/index.js
import { application } from "./application"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

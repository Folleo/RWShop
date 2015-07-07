@app = angular.module('app', [])


@app.run(->
  console.log 'angular app running'
)
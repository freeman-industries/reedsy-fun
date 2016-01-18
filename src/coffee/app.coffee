# Start the app
app = angular.module 'books', ['angular.filter', 'ngRoute', 'ngAnimate', 'ngSanitize', 'ngTouch', 'ng-fastclick', 'templates-main']

# Set routes & page definitions
app.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

	$locationProvider.html5Mode(true)
	
	$routeProvider

	.when '/',
		templateUrl : '/pages/home.html'
		controller  : 'homeController'

	.when '/book/:slug',
		templateUrl : '/pages/book.html',
		controller  : 'bookController'

	return null
]

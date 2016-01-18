app.run ['$rootScope', ($rootScope) ->

	window.$rootScope = $rootScope

	$rootScope.data = {}

	$.get("./cage.json", (books) ->
		$rootScope.books = books

		categories = []
		genres = []

		for book in $rootScope.books
			# add a url slug for each book
			book.slug = book.name.toLowerCase().split(" ").join("-") + "-" + book.id

			# populate categories
			if book.genre.category not in categories
				categories.push(book.genre.category)

			if book.genre.name not in genres
				genres.push(book.genre.name)


		genres.sort()
		categories.sort()

		genres.unshift("Everything")
		categories.unshift("All")

		$rootScope.genres = genres
		$rootScope.categories = categories

		$rootScope.data.selectedGenre = $rootScope.genres[0]
		$rootScope.data.selectedCategory = $rootScope.categories[0]

		$rootScope.$apply()
	)

	return null
]
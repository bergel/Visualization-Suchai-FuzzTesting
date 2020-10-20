Class {
	#name : #BaselineOfVisualizationSuchaiFuzzTesting,
	#superclass : #BaselineOf,
	#category : #BaselineOfVisualizationSuchaiFuzzTesting
}

{ #category : #baselines }
BaselineOfVisualizationSuchaiFuzzTesting >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'VisualizationSuchaiFuzzTesting' ]
]

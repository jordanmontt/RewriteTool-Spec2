"
A RuleChangesForMatchToolPresenterTest is a test class for testing the behavior of RuleChangesForMatchToolPresenter
"
Class {
	#name : #RuleChangesForMatchToolPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'tool'
	],
	#category : #'RewriteTool-Tests'
}

{ #category : #running }
RuleChangesForMatchToolPresenterTest >> setUp [

	super setUp.

	tool := RuleChangesForMatchToolPresenter new
]

{ #category : #test }
RuleChangesForMatchToolPresenterTest >> testAddMatchToolChange [

	tool addMatchToolChange: MatchToolPresenter new.
	self denyEmpty: tool items
]

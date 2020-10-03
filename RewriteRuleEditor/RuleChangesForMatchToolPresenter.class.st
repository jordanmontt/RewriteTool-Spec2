Class {
	#name : #RuleChangesForMatchToolPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'matchExpressionListPresenter',
		'pharoCodePresenter',
		'patternCodePresenter',
		'matchExpressionCollection'
	],
	#category : #'RewriteRuleEditor-RuleChanges'
}

{ #category : #specs }
RuleChangesForMatchToolPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #matchExpressionListPresenter width: 200;
		  add: (SpBoxLayout newVertical
				   add: #patternCodePresenter;
				   add: #pharoCodePresenter;
				   yourself);
		  yourself
]

{ #category : #'instance creation' }
RuleChangesForMatchToolPresenter class >> with: aCollection [

	^ self new matchExpressionCollection: aCollection
]

{ #category : #initialization }
RuleChangesForMatchToolPresenter >> changesAsPresenters [

	^ matchExpressionCollection ifNil: [ #(  ) ] ifNotNil: [ 
		  matchExpressionCollection collection collect: [ :matchExpression | 
			  (self instantiate: RuleChangePanelPresenter) 
				  matchExpression: matchExpression ] ]
]

{ #category : #initialization }
RuleChangesForMatchToolPresenter >> initializeExpressionListItems [

	matchExpressionListPresenter presenters: self changesAsPresenters
]

{ #category : #initialization }
RuleChangesForMatchToolPresenter >> initializePresenters [

	matchExpressionListPresenter := self newComponentList.
	pharoCodePresenter := self newCode.
	patternCodePresenter := self newCode.
	self focusOrder add: matchExpressionListPresenter
]

{ #category : #initialization }
RuleChangesForMatchToolPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Load Match Tool recent changes';
		initialExtent: 700 @ 350;
		askOkToClose: false;
		aboutText: ''
]

{ #category : #accessing }
RuleChangesForMatchToolPresenter >> matchExpressionCollection: aCollection [

	matchExpressionCollection := aCollection.
	self initializeExpressionListItems
]

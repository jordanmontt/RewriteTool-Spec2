Class {
	#name : #TempRuleChanges,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #'RewriteRuleEditor-RuleChanges'
}

{ #category : #adding }
TempRuleChanges >> addChange: aPresenter [

	collection add: (TempRuleChangesModel new
			 lhs: aPresenter patternCode;
			 inputCode: aPresenter pharoCode)
]

{ #category : #accessing }
TempRuleChanges >> collection [
	^ collection
]

{ #category : #initialization }
TempRuleChanges >> initialize [

	super initialize.
	collection := OrderedCollection new
]

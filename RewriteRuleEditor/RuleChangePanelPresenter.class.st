Class {
	#name : #RuleChangePanelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'codeLabel',
		'timeLabel',
		'matchExpression',
		'patternLabel'
	],
	#category : #'RewriteRuleEditor-RuleChanges'
}

{ #category : #specs }
RuleChangePanelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  borderWidth: 1;
		  spacing: 2;
		  add: #codeLabel expand: false;
		  add: #patternLabel expand: false;
		  add: #timeLabel expand: false;
		  yourself
]

{ #category : #'instance creation' }
RuleChangePanelPresenter class >> on: aMatchExpression [

	^ self new matchExpression: aMatchExpression
]

{ #category : #accessing }
RuleChangePanelPresenter >> getFirstCodeLine [

	^ self getFirstLineOfString: matchExpression inputCode 
]

{ #category : #accessing }
RuleChangePanelPresenter >> getFirstLineOfString: aString [

	| aStream line |
	aStream := aString readStream. 
		[ 
		aStream atEnd not and: [ (line := aStream nextLine asString trimmed) isEmpty ] ]
			whileTrue.
		line isEmptyOrNil ifFalse: [ ^ line ] .

	^ 'Empty'
]

{ #category : #accessing }
RuleChangePanelPresenter >> getFirstPatternLine [

	^ self getFirstLineOfString: matchExpression lhs
]

{ #category : #accessing }
RuleChangePanelPresenter >> getTimeAsString [

	^ matchExpression creationTime epiceaBrowsersAsString
]

{ #category : #initialization }
RuleChangePanelPresenter >> initializeLabels [

	codeLabel label: self getFirstCodeLine.
	timeLabel label: self getTimeAsString.
	patternLabel label: self getFirstPatternLine
]

{ #category : #initialization }
RuleChangePanelPresenter >> initializePresenters [

	codeLabel := self newLabel.
	patternLabel := self newLabel.
	timeLabel := self newLabel
		             addStyle: 'dim';
		             yourself
]

{ #category : #accessing }
RuleChangePanelPresenter >> matchExpression: anObject [

	matchExpression := anObject.
	self initializeLabels
]

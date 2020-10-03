"
I am a data transmition object. I hold a rewrite rule and the time in which has created
"
Class {
	#name : #TempRuleChangesModel,
	#superclass : #Object,
	#instVars : [
		'creationTime',
		'lhs',
		'rhs',
		'inputCode',
		'outputCode'
	],
	#category : #'RewriteRuleEditor-RuleChanges'
}

{ #category : #accessing }
TempRuleChangesModel >> creationTime [
	^ creationTime
]

{ #category : #accessing }
TempRuleChangesModel >> creationTime: anObject [
	creationTime := anObject
]

{ #category : #initialization }
TempRuleChangesModel >> initialize [

	super initialize.
	creationTime := DateAndTime now
]

{ #category : #accessing }
TempRuleChangesModel >> inputCode [

	^ inputCode
]

{ #category : #accessing }
TempRuleChangesModel >> inputCode: anObject [
	inputCode := anObject
]

{ #category : #accessing }
TempRuleChangesModel >> lhs [
	^ lhs
]

{ #category : #accessing }
TempRuleChangesModel >> lhs: anObject [
	lhs := anObject
]

{ #category : #accessing }
TempRuleChangesModel >> outputCode [
	^ outputCode
]

{ #category : #accessing }
TempRuleChangesModel >> outputCode: anObject [
	outputCode := anObject
]

{ #category : #accessing }
TempRuleChangesModel >> rhs [
	^ rhs
]

{ #category : #accessing }
TempRuleChangesModel >> rhs: anObject [
	rhs := anObject
]

VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ProgressView 
   Caption         =   "Progress"
   ClientHeight    =   1305
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5010
   OleObjectBlob   =   "ProgressView.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "ProgressView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const PROGRESSBAR_MAXWIDTH As Integer = 224

Public Event Activated()
Public Event Cancelled()

Private Sub UserForm_Activate()
    ProgressBar.Width = 0 ' it's set to 10 to be visible at design-time
    RaiseEvent Activated
End Sub

Public Sub Update(ByVal percentValue As Single, Optional ByVal labelValue As String, Optional ByVal captionValue As String)

    If labelValue <> vbNullString Then
        ProgressLabel.Caption = labelValue
    End If

    If captionValue <> vbNullString Then
        Me.Caption = captionValue
    End If

    ProgressBar.Width = percentValue * PROGRESSBAR_MAXWIDTH
    DoEvents

End Sub

Public Property Get CurrentProgress() As Double
    CurrentProgress = ProgressBar.Width / PROGRESSBAR_MAXWIDTH
End Property

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If CloseMode = 0 Then
        Cancel = True
        RaiseEvent Cancelled
    End If
End Sub

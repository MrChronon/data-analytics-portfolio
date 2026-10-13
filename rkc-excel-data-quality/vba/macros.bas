Option Explicit

Sub Svod_Ishodnik()

    Dim wsSrc As Worksheet
    Dim wsDst As Worksheet
    Dim lastRow As Long
    Dim r As Long
    Dim outRow As Long
    Dim debtEnd As Double

    Set wsSrc = ThisWorkbook.Worksheets("Отчет")
    Set wsDst = ThisWorkbook.Worksheets("3 (по исходнику)")

    lastRow = wsSrc.Cells(wsSrc.Rows.Count, "C").End(xlUp).Row
    outRow = 7

    wsDst.Range("A7:B" & wsDst.Rows.Count).ClearContents

    For r = 6 To lastRow

        If IsNumeric(wsSrc.Cells(r, "E").Value) And _
           IsNumeric(wsSrc.Cells(r, "J").Value) And _
           IsNumeric(wsSrc.Cells(r, "K").Value) Then

            debtEnd = CDbl(wsSrc.Cells(r, "E").Value) + _
                      CDbl(wsSrc.Cells(r, "J").Value) - _
                      CDbl(wsSrc.Cells(r, "K").Value)

            If debtEnd > 0 Then
                wsDst.Cells(outRow, "A").Value = wsSrc.Cells(r, "C").Value
                wsDst.Cells(outRow, "B").Value = debtEnd
                outRow = outRow + 1
            End If

        End If

    Next r

End Sub


Sub Svod_Rekonstrukciya()

    Dim wsSrc As Worksheet
    Dim wsDst As Worksheet
    Dim lastRow As Long
    Dim r As Long
    Dim outRow As Long
    Dim debtEnd As Double

    Set wsSrc = ThisWorkbook.Worksheets("Отчет (реконструкция)")
    Set wsDst = ThisWorkbook.Worksheets("3 (по реконструкции)")

    lastRow = wsSrc.Cells(wsSrc.Rows.Count, "C").End(xlUp).Row
    outRow = 7

    wsDst.Range("A7:B" & wsDst.Rows.Count).ClearContents

    For r = 6 To lastRow

        If IsNumeric(wsSrc.Cells(r, "E").Value) And _
           IsNumeric(wsSrc.Cells(r, "J").Value) And _
           IsNumeric(wsSrc.Cells(r, "K").Value) Then

            debtEnd = CDbl(wsSrc.Cells(r, "E").Value) + _
                      CDbl(wsSrc.Cells(r, "J").Value) - _
                      CDbl(wsSrc.Cells(r, "K").Value)

            If debtEnd > 0 Then
                wsDst.Cells(outRow, "A").Value = wsSrc.Cells(r, "C").Value
                wsDst.Cells(outRow, "B").Value = debtEnd
                outRow = outRow + 1
            End If

        End If

    Next r

End Sub

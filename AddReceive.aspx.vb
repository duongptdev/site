
Imports swEDoc

Partial Class AddReceive
    Inherits System.Web.UI.Page

    Protected Sub btnAddRecei_Click(sender As Object, e As EventArgs)
        Dim serv As apiEdoc = New apiEdoc()
        Dim idfile As Integer = Integer.Parse(Session("idFile").ToString())
        Dim email As String = txtEmail.Text
        Dim res As Integer = serv.GuiVB_Capnhatchitietguinguoinhan(idfile, email)

        If res = 1 Then
            Response.Redirect("AddSigntureField")
        End If
    End Sub
End Class

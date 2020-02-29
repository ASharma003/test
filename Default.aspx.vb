Imports System.Configuration
Imports System.Data.SqlClient

Public Class _Default
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtEmpID.Focus()
        End If
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("myConnectionString").ConnectionString
        Dim conn = New SqlConnection(connectionString)
        Dim count As Integer
        Try
            Dim vsql = "SELECT count(*) FROM register WHERE EmployeeID=" & txtEmpID.Text & " AND EmailID='" & txtEmpEmail.Text & "'"
            conn.Open()
            Dim Command = New SqlCommand(vsql, conn)
            count = Command.ExecuteScalar()
            Command.Dispose()
            conn.Close()
        Catch ex As Exception
            conn.Close()
        End Try
        If count = 1 Then
            Response.Redirect("Dashboard.aspx")
        Else
            lblMsg.Text = "Invalid Login Credentials."
            lblMsg.Visible = True
        End If
    End Sub
End Class
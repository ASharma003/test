Imports System.Data.SqlClient
Public Class Dashboards
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtDate.Focus()
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If hflag.Value = "True" Then
            Dim vquery = "SELECT cd.NTID,
                            MAX(CASE cd.Status WHEN 'Failed' THEN (SELECT COUNT(*) FROM casedetails c WHERE STATUS = 'Failed' AND c.NTID=cd.NTID) ELSE 0 END) AS Failed,
                            MAX(CASE cd.Status WHEN 'Processed' THEN (SELECT COUNT(*) FROM casedetails c WHERE STATUS = 'Processed' AND c.NTID=cd.NTID) ELSE 0 END) AS Processed,
                            MAX(CASE cd.Status WHEN 'Processing' THEN (SELECT COUNT(*) FROM casedetails c WHERE STATUS = 'Processing' AND c.NTID=cd.NTID) ELSE 0 END) AS Processing
                            FROM casedetails cd
                            GROUP BY cd.NTID ORDER BY cd.NTID;"

            Dim connectionString As String = ConfigurationManager.ConnectionStrings("myConnectionString").ConnectionString
            Dim conn = New SqlConnection(connectionString)
            Try
                conn.Open()
                Dim Command = New SqlCommand(vquery, conn)
                Dim sda As New SqlDataAdapter(Command)
                conn.Close()
                Dim ds As New DataSet()
                sda.Fill(ds)
                grid.DataSource = ds
                grid.DataBind()
            Catch ex As Exception
                conn.Close()
            End Try
        End If

    End Sub
End Class
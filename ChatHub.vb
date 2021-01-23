Imports Microsoft.AspNet.SignalR





Public Class ChatHub
    Inherits Hub
    Dim db As New ChatEntities
    Public Shared ConnectedUsers As New List(Of UserDetail)()
        Public Shared CurrentMessage As New List(Of MessageDetail)()
        Public Shared oid, ogroup As String

    Public Sub Connect(userName As String)

        Dim user = (From u In db.UserRooms
                    Where u.user_name = userName.Trim
                    Select u).SingleOrDefault()

        If Not user Is Nothing Then
                'e.Authenticated = True
                oid = user.user_id.ToString
                ogroup = user.user_org.ToString

            Else
                'e.Authenticated = False
                oid = "1"
                ogroup = "1"

            End If

            Dim id = Context.ConnectionId

            If ConnectedUsers.Where(Function(x) x.ConnectionId = id).Count = 0 Then
                ConnectedUsers.Add(New UserDetail() With {.ConnectionId = id, .UserName = userName})

                ' send to caller
                Clients.Caller.onConnected(id, userName, ConnectedUsers, CurrentMessage)

                ' send to all except caller client

                Clients.AllExcept(id).onNewUserConnected(id, userName)

            End If

        End Sub
    End Class
    Public Class UserDetail
        Public Property Id As String
    Public Property UserName As String
    Public Property ConnectionId As String
End Class

    Public Class MessageDetail
        Public Property ID As String
        Public Property Content As String
    End Class

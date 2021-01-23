
Imports Microsoft.Owin
Imports Owin


<Assembly: OwinStartup(GetType(site.Startup))>

Namespace site
    Public Class Startup
        Public Sub Configuration(ByVal app As IAppBuilder)

            app.MapSignalR()
        End Sub
    End Class
End Namespace


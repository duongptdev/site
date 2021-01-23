﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
    <link href="style.css" rel="stylesheet" />
  <%--  <link rel="stylesheet" href="../../style.css" />--%>
    <%--  <script src="../lib/webviewer.min.js"></script>--%>
    <script src="lib/webviewer.min.js"></script>
    <script src="modernizr.custom.min.js"></script>
     <%--  <script src="../modernizr.custom.min.js"></script>--%>
   <%--   <script src="../old-browser-checker.js"></script>
      <script src="../global.js"></script>--%>
    <script src="old-browser-checker.js"></script>
    <script src="global.js"></script>
</head>
<body>
  <%-- <form id="form1" runat="server">--%>
      <header>

      <div class="title sample">Viewing with WebViewer Server sample</div>
    </header>
    <aside>
      <h1>Controls</h1>
        <button type="button" onclick="SaveFile()">Button</button>
       <%-- <input type="button" value="save" onclick="SaveFile()" />--%>
      <h2>Choose a file to view</h2>
      <select id="select" style="width: 100%">
        <option value="https://pdftron.s3.amazonaws.com/downloads/pl/demo-annotated.pdf">https://pdftron.s3.amazonaws.com/downloads/pl/demo-annotated.pdf</option>
        <option value="https://pdftron.s3.amazonaws.com/downloads/pl/report.docx">https://pdftron.s3.amazonaws.com/downloads/pl/report.docx</option>
        <option value="https://pdftron.s3.amazonaws.com/downloads/pl/presentation.pptx">https://pdftron.s3.amazonaws.com/downloads/pl/presentation.pptx</option>
      </select>
      <h2>Or pass a url to a document</h2>
      <form id="url-form">
        <input id="url" type="text" style="width: 100%" />
        <input type="submit" value="Submit" />
      </form>
      <h2>Or choose your own</h2>
      <input id="file-picker" type="file" accept=".pdf,.jpg,.jpeg,.png,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.md,.dwg,.dxf,.dgn,.rtf,.odt,.ods,.odp,.bmp,.wmf,.emf,.gif,.jpc,.tif,.html,.txt" />
      <hr />
      <h1>Instructions</h1>
      <strong>When using WebViewer together with WebViewer Server, only publicly accessible urls and file blobs can be loaded.</strong><br />
      <strong>If you choose a local file or file blob to view, it will be uploaded to our demo server.</strong>
      <p>Use the dropdown above to view local or remote documents. The following file types are supported by WebViewer Server:</p>
      <div class="file-formats">
        <ul>
          <li>.pdf</li>
          <li>.jpg</li>
          <li>.jpeg</li>
          <li>.png</li>
          <li>.doc</li>
          <li>.docx</li>
          <li>.xls</li>
          <li>.xlsx</li>
          <li>.ppt</li>
          <li>.pptx</li>
          <li>.md</li>
          <li>.xod</li>
          <li>.dwg</li>
        </ul>
        <ul>
          <li>.dxf</li>
          <li>.dgn</li>
          <li>.dwg</li>
          <li>.rtf</li>
          <li>.odt</li>
          <li>.ods</li>
          <li>.odp</li>
          <li>.bmp</li>
          <li>.wmf</li>
          <li>.emf</li>
          <li>.gif</li>
          <li>.jpc</li>
          <li>.tif</li>
          <li>.html</li>
        </ul>
        <ul>
          <li>.txt</li>
        </ul>
      </div>
      <p>Visit <a href="https://www.pdftron.com/documentation/web/guides/file-format-support" target="_blank">here</a> for a full list of supported file formats.</p>
    </aside>
    <div id="viewer"></div>
  <%--  <script src="../../menu-button.js"></script>--%>
       <script src="menu-button.js"></script>
    <!--ga-tag-->

    <script>
      Modernizr.addTest('async', function() {
        try {
          var result;
          eval('let a = () => {result = "success"}; let b = async () => {await a()}; b()');
          return result === 'success';
        } catch (e) {
          return false;
        }
      });

      // test for async and fall back to code compiled to ES5 if they are not supported
      ['viewing-with-webviewer-server.js'].forEach(function(js) {
        var script = Modernizr.async ? js : js.replace('.js', '.ES5.js');
        var scriptTag = document.createElement('script');
        scriptTag.src = script;
        scriptTag.type = 'text/javascript';
        document.getElementsByTagName('head')[0].appendChild(scriptTag);
      });
    </script>
  <%--  </form>--%>
</body>
</html>

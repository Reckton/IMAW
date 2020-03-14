<html>
<head>
</head>
<body bgcolor=#c1f7d8>
<center>
<%
dim strname,strpclass,strnote,strqq,strhomepage,strpassword,strdept
strname=request.form("name")
strclass=request.form("class")
strqq=request.form("qq")
strhomepage=request.form("homepage")
strnote=request.form("note")
strdept=request.form("dept")

if strname=""  then
	response.write "<script language=JavaScript>" & "alert('姓名不能为空！');" & "history.go(-1);" & "</script>" 

end if


if strclass=""  then
	response.write "<script language=JavaScript>" & "alert('专业班级不能为空！');" & "history.back();" & "</script>" 


end if

set cn=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")
strconn="driver={microsoft access driver (*.mdb)};dbq="&server.mappath("info.mdb")
cn.open strconn
selstr="select * from user where username='" & strname & "'"
rs.open selstr,cn,1,1

if not (rs.eof) then
   	response.write "<script language=JavaScript>" & "alert('信息表内已有该成员');" & "history.back();" & "</script>" 
    rs.close
    set rs=nothing
    cn.close
    set cn=nothing
else
    set rsin=server.createobject("adodb.recordset")
    strin="insert into user values('"&strname&"','"&strclass&"','"&strqq&"','"&strhomepage&"','"&strnote&"','"&strdept&"')"
    rsin.open strin,cn
    response.write "<script language=JavaScript>" & "alert('储存成功');" & "history.back();" & "</script>" 
    cn.close
    set cn=nothing
end if
%>
</body>
</html>





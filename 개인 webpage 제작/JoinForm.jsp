<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>ȸ������ ȭ��</title>
    
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
<script>
function check(){
	if(!document.JoinForm.id.value){
		alert("ID�� �Է��ϼ���.");
		return false;
	}
	if(!document.JoinForm.password.value){
		alert("Password�� �Է��ϼ���.");
		return false;
	}
	if(!document.JoinForm.password.value !=document.JoinForm.repassword.value){
		alert("Password�� �ٸ��ϴ�.");
		return false;
	}
}

</script>

</head>
<body>
    <!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">ȸ������</font></b>
        <br><br><br>
        
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
        
        <form name="JoinForm" method="post" action="joinOk.jsp"onsubmit="return check(this)">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                        <input type="button" value="�ߺ�Ȯ��" onclick="check_id()">    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="20"  class="invalid-feedback"> 4~12���� ���� ��ҹ��ڿ� ����
                    </td>
                </tr>
                
                <tr>
                    <td id="title">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15" class="invalid-feedback"> 4~12���� ���� ��ҹ��ڿ� ����
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�������</td>
                    <td>
                        <input type="text" name="birthday" placeholder="ex)19910101">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�̸���</td>
                    <td>
                        <input type="text" name="email" maxlength="30">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" />
                        <input type="button" value="������ȣ �ޱ�" >
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���" onclick="location.href='index.html'">
        </form>
    </div>

</body>
</html>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <style>
            .table{
                width:90%;
                margin: 1em auto;
            }
        </style>
    </head>    
    <body>
        <h1>Hello JSP</h1>
        <h2>Hello Spring JPA Ajax</h2>
        <hr>
        <button id="btn1">데이터 가져오기(json 데이터 1개- 객체)</button>
        <button id="btn2">데이터 가져오기(json 데이터 여러 개-배열)</button>
        <hr color="red">
        <div id="result">
        </div>

        <script>
            const btn1=document.querySelector('#btn1');
            const btn2=document.querySelector('#btn2');
            const result=document.querySelector('#result');
            let req=null;
            //Ajax ==> Asynchronous JavaScript and XML
            btn1.onclick=function(){
                req=new XMLHttpRequest();//ajax 통신을 하는 객체
                let url="/api/books/json"
                req.onload= function(){
                    //alert(req.status);//200 OK
                    if(req.status==200){
                        //성공적인 응답을 받았다면
                        //응답 데이터를 받자 (req.responseText, req.responseXML)
                        let res=req.responseText;
                        //alert(res);
                        //alert(typeof(res));//string 데이터로 온다.(내용은 json형태의 문자열)
                        //[1] string을 json객체로 변환: JSON.parse(문자열)
                        //[2] json을 string으로 변환 : JSON.stringify(json객체)
                        let obj=JSON.parse(res);
                        //alert(typeof(obj)); //object ==> json객체
                        //alert(obj.title+"/"+obj.publish+"/"+obj.price+"/"+obj.bookImage);
                        //백틱 사용: ``
                        result.innerHTML=`
                            <h1>도서 제목: \${obj.title}</h1>
                            <h1>출 판 사 : \${obj.publish}</h1>
                            <h1>가    격 : \${obj.price}</h1>
                            <img src="/images/\${obj.bookImage}" style="width:220px">
                        `
                    }
                }//onload-------------
                req.open('GET', url, true);//method, url, async (비동기방식 여부)
                req.send();//get방식일 때는 send() 비어서 가고
                            //post방식일 때는 send(파라미터 데이터들)

            }//btn1.onclick---------------

            btn2.onclick=()=>{ //화살표 함수
                req=new XMLHttpRequest();
                let url="/api/books/jsonArr";
                req.onload=()=>{ //응답이 왔을 때
                        if(req.status>=200 && req.status<300){
                            //alert(req.responseText);

                            let jsonArr = JSON.parse(req.responseText);
                            let tableContent=`<table class="table">
                            <tr>
                            `;

                            for(let i=0;i<jsonArr.length;i++){
                                let obj=jsonArr[i];
                                tableContent+=`

                                <td>
                                    <h3>\${obj.title}</h3>
                                    <h3>\${obj.publish}</h3>
                                    <h3>\${obj.price}</h3>
                                    <img src="/images/\${obj.bookImage}" width="200px">
                                </td>

                                `
                            }
                            tableContent+=`</tr></table>`
                            result.innerHTML = tableContent;
                            alert(result.innerHTML)

                        }


                    }
                    req.open("GET",url,true);
                    req.send();
            }//btn2.onclick--------------------
        </script>

    </body>
</html>
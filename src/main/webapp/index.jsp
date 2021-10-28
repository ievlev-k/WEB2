<%@ page import="Date.Table" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">
<%
    ArrayList<Table> results = new ArrayList<>();
    if (request.getSession().getAttribute("results") != null){
        results = (ArrayList<Table>) request.getSession().getAttribute("results");
    }
%>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа</title>
    <link rel="stylesheet" href="css/main.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="js/submit.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/canvas.js" type="text/javascript"></script>



</head>
<body>

<table class="table_main" >
    <tr >
        <th colspan="2" class="header_th">
            <p class="header_title">
                Иевлев Кирилл, Группа: P3233, Вариант:33008
            </p>
        </th>
    </tr>
    <tr>
        <td class="main-graph">
            <canvas id="canvas"  width="500px" height="500px" onclick="canvasClick(event)">

            </canvas>

            <%
                for (Table result : results) {
            %>
            <input type="hidden" name="drawPoint" data-x="<%=result.getX()%>" data-y="<%=result.getY()%>" data-r="<%=result.getR()%>" >
            <%
                }
            %>

            <form method="get" action="${pageContext.request.contextPath}/Controller">

                <p class="main-graph_title">Выбирите X:</p>
                <fieldset id = x class="main-radio_parameters">
                    <input class = main-offer_radio type = "radio" name = "x" id = x-5 value = -5  onchange="radioChanged(-4, this)" >
                    <label for="x-5" class = input_label> -5</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x-4 value = -4 onchange="radioChanged(-4, this)">
                    <label for="x-4" class = input_label> -4</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x-3 value = -3 onchange="radioChanged(-3, this)">
                    <label for="x-3" class = input_label> -3</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x-2 value = -2 onchange="radioChanged(-2, this)">
                    <label for="x-2" class = input_label> -2</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x-1 value = -1 onchange="radioChanged(-1, this)">
                    <label for="x-1" class = input_label> -1</label>
                    <br>
                    <input class = main-offer_radio type = "radio" name = "x" id = x0 value = 0 onchange="radioChanged(0, this)">
                    <label for="x0" class = input_label> 0</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x1 value = 1 onchange="radioChanged(1, this)">
                    <label for="x1" class = input_label> 1</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x2 value = 2 onchange="radioChanged(2, this)">
                    <label for="x2" class = input_label> 2</label>
                    <input class = main-offer_radio type = "radio" name = "x" id = x3 value = 3 onchange="radioChanged(3, this)">
                    <label for="x3" class = input_label> 3</label>
                </fieldset>
                <input type="hidden"  name="clickX" id="clickX">

                <label for="y" class = main-graph_title>Изменения Y: (-5...5)</label>
                <input class = main-graph_parameters maxlength="15" type = text name="y" id = y onchange="textChanged()">
                <input type="hidden"  name="clickY" id="clickY">
                <br>
                <p class="invalidData_label" name="messageY" id="messageY"></p>
                <br>
                <p class="main-graph_title">Выбирите R:</p>
                <fieldset id = rSet class="main-button_parameters">
                    <input class="main-offer_button" type = button name="r1" value= 1 onclick="buttonClick(1, this)">
                    <input class="main-offer_button" type = button name="r2" value= 1.5 onclick="buttonClick(1.5, this)">
                    <input class="main-offer_button" type = button name="r3" value= 2 onclick="buttonClick(2, this)">
                    <input class="main-offer_button" type = button name="r4" value= 2.5 onclick="buttonClick(2.5, this)">
                    <input class="main-offer_button" type = button name="r5" value= 3 onclick="buttonClick(3,this)">
                    <input type="hidden" value="" name="r" id = r >
                </fieldset>

                <br>
                <p class="invalidData_label" id="messageR"></p>
                <p class ="input_label" id="messageRvalue"></p>
                <br>
                <input class =main-graph_button_res type = submit value = "Проверить" id="submitData" data-submit >
                <input class = main-graph_button_sub type = submit name = clearValues id = "clearValues" value = "Очистить" data-reset>
                <br>

            </form>
            <input type="hidden" value="false" name="reset-flag" id="reset-flag">
        </td>
        <td class="main-table">

            <table class="main-table_results" >
                <tbody id="tableBody">
                <tr >
                    <th >X</th>
                    <th>Y</th>
                    <th >R</th>
                    <th >Попадание</th>

                </tr>
                <%
                    for (Table result : results) {
                %>
                <tr>
                    <td><%=result.getX()%>
                    </td>
                    <td><%=result.getY()%>
                    </td>
                    <td><%=result.getR()%>
                    <td><%=result.getHit()%>
                    </td>
                </tr>
                <%
                    }
                    ;
                %>
                </tbody>

            </table>
        </td>
    </tr>
</table>

</body>

</html>

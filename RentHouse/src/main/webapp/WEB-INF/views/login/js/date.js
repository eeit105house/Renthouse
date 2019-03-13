
 document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("birth_Year").addEventListener("change", addMDate);
            document.getElementById("birth_Month").addEventListener("change", addDate);

            for (i = 1900; i <= 2200; i++) {   //新增年 
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>
                document.getElementById('birth_Year').appendChild(opt);
            }
            for (i = 1; i <= 12; i++) {   //新增月 
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>

                document.getElementById('birth_Month').appendChild(opt);
            }
            for (i = 1; i <= 31; i++) {   //新增日
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>
                document.getElementById('birth_Date').appendChild(opt);
            }
 });
        function addMDate() {
            document.getElementById("birth_Month").innerHTML = "";
            document.getElementById("birth_Date").innerHTML = "";
            var yy = document.getElementById("birth_Year").value;
            var d = new Date(yy, 0, 0);
            var dNo = d.getDate();
            var MNo = d.getMonth();
            for (i = 1; i <= MNo + 1; i++) {   //新增月 
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>
                // opt.value = i;
                // opt.innerHTML = i;
                document.getElementById('birth_Month').appendChild(opt);
            }
            for (i = 1; i <= dNo; i++) {   //新增日 
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>
                // opt.value = i;
                // opt.innerHTML = i;
                document.getElementById('birth_Date').appendChild(opt);
            }

        }
        function addDate() {
            document.getElementById("birth_Date").innerHTML = "";
            var yy = document.getElementById("birth_Year").value;
            var mm = document.getElementById("birth_Month").value;
            var d = new Date(yy, mm, 0);
            var dNo = d.getDate();

            for (i = 1; i <= dNo; i++) {   //新增日 
                var opt = document.createElement("option");//<option></option>
                opt.setAttribute("value", i);//<option value="1"></option>
                var optTxt = document.createTextNode(i);//1,2,
                opt.appendChild(optTxt);//<option value="1">1</option>
                // opt.value = i;
                // opt.innerHTML = i;
                document.getElementById('birth_Date').appendChild(opt);
            }
        }
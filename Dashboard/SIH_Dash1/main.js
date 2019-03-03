let velem = document.getElementById('vert');
let helem = document.getElementById('horz');
let mainc = document.getElementById('main');
let reqHeight = document.getElementById('vert').offsetHeight/10;
let reqWidth = document.getElementById('horz').offsetWidth/9;
let message = '';
let horMessage = '';
let cmessage = '';
let tempcont = [];
let cont = [];
let mymess = '<div class="square text-center" id="square" style ="width: ' + reqWidth +'px ;   height: '+ reqHeight +'px">';
let mymess1 = '<div class="squaree" id="squaree" style ="width: ' + reqWidth +'px ;   height: '+ reqHeight +'px">';
let topics = ['STATE','AGE','SOE','RTN','CER','SCI','TOTAL' , 'GEN']
let mymess2aa = '<div class="thumbnail grow text-center" onclick="dothis('
let mymess2ab = ')" id="';
let mymess2b = '" style ="width: ' + reqWidth +'px ;   height: '+ reqHeight +'px">';
let mymess3 = '<div class="squares   text-center" id="squares" style ="width: ' + reqWidth +'px ;   height: '+ reqHeight +'px">';
let urls;
let row , column , plots
let tooltip = '<img src = "./gplot.png" style="height: 90% ; width: 90% ; border-radius: 15px"  alt="img" title="plot between ';
var doc = new jsPDF()

let numbermap = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: 'seven',
    8: "eight",
    9: "nine"
}

message = message.concat(mymess1,'</div>');


// setting vertical topics size
for(let i=0;i<8;++i){                
    message = message.concat(mymess,topics[i],'</div>');

}

// setting horizontal topics size
for(let i=0;i<8;++i){
    horMessage = horMessage.concat(mymess,topics[i],'</div>');
}

// setting main thumbnail sizes

for(let i=0;i<8;++i){      
    tempcont = [];          
    for(let j = 0; j<8;++j){
        if(i===j){
            cmessage = cmessage.concat(mymess3,'</div>');
            tempcont.push(mymess3.concat('</div>'))
        }else{
            // console.log(numbermap[i])
            if((j==7 && i != 0) ||( j==7 && i!=1 ) || (i==7 && j!=0) || (i==7 && j!=1)){
                    cmessage = cmessage.concat(mymess2aa,i,',',j,',',1,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>');
                    tempcont.push(mymess2aa.concat(i,',',j,',',1,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>'));
                    continue;
                    
            }
            if((j==0 && i != 1) || (j==1 && i!=0) || (i==1 && j!=0)){
                cmessage = cmessage.concat(mymess2aa,i,',',j,',',1,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>');
                tempcont.push(mymess2aa.concat(i,',',j,',',1,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>'));
                
            }
            // 
            else{
                cmessage = cmessage.concat(mymess2aa,i,',',j,',',0,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>');
                tempcont.push(mymess2aa.concat(i,',',j,',',0,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,'</div>'));
            }
        }
    }
    cont.push(tempcont);
}
// console.log(document.getElementById("main"))
$(document).ready(function() {
    // document.getElementById("three-five").style.backgroundImage = "url('ministryLogo.png')";
        for(let i=0;i<8;++i){
            for(let j = 0 ;j< 8;++j){
                if(i===j){
                    continue;
                }
                let  mynum =  numbermap[i] + "-" + numbermap[j];

                console.log(mynum , typeof(val))
               if((i==0 && j != 1 )|| (j== 0  && i!=1) || (i==1 && j!=0) || (j==1 && i!=0) || i==7 || j==7){
                   
                //    console.log(val)
                //   console.log(document.getElementById(val))

                document.getElementById(mynum).style.backgroundImage ='url(piePlot.png)';
                    // $.ajax({ url: 'http://127.0.0.1:12345/piethumb',
                    //         data: JSON.stringify({label: String(i), value: String(j)}),
                    //         type: 'POST',
                    //         dataType: "JSON",
                    //         beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    //         success: function(output) {
                    //         console.log((output['ans']))
                    //         document.getElementById(mynum).style.backgroundImage = output['ans'];
                    //         // console.log(document.getElementById(mynum))
                    //     }
                    // });
               }else{
                // console.log(val)
                // console.log(document.getElementById(val))
        
                document.getElementById(mynum).style.backgroundImage ='url(scatterPlot.png)';

                    // $.ajax({ url: 'http://127.0.0.1:12345/scatterthumb',
                    //         data: JSON.stringify({label: String(i), value: String(j)}),
                    //         type: 'POST',
                    //         dataType: "JSON",
                    //         beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    //         success: function(output) {
                    //         console.log(output['ans'])
                    //         document.getElementById(mynum).style.backgroundImage = output['ans'];
                    //     }
                    // });           
                }
                // if((i==0 && j==7) ||(i==1 && j==7) || (i==7 && j==0) || (i==7 && j==1)){
                //     document.getElementById(mynum).style.backgroundImage ='url(scatterPlot.png)';
                // }
            }
        }
});


// yaha pe modal wala code likhna mat bhulnaaaaaaa
let modal = document.getElementById('myModal');
let span = document.getElementsByClassName("close")[0];
span.onclick = function() {
    document.getElementById('showPlot').style.display = "none";
    btn1.style.backgroundColor = '#5a6268';
    btn2.style.backgroundColor = '#6c757d';

    modal.style.display = "none";
}

window.onclick = function(event) {
if (event.target == modal) {
    document.getElementById('showPlot').style.display = "none";
    modal.style.display = "none";
}
}
// let mydiv  = $('#main').find('#01');

// console.log(mydiv)

const addClick = () => {
    for(let i=0;i<7;++i){
        for(let j=0;j<7;++j){
            if(i==j){
                continue;
            }
            let str = String(i) + String(j);
            
          
            document.getElementById(str).addEventListener("click",() => {
                console.log(document.getElementById(str).id)
                modal.style.display = "block";
            })
                
        }
    }
}


const dothis = (rows, columns , plots) => {
    let modal = document.getElementById('myModal');
    let span = document.getElementsByClassName("close")[0];
    let btn1 = document.getElementById('btn1');
    let btn3 = document.getElementById('btn3');
    let btn2 = document.getElementById('btn2');
    btn1.style.backgroundColor = '#5a6268';
     
    row = rows
    column = columns
    plot = plots

    if(plots == 1){
        btn2.style.visibility = "visible";

        btn1.innerHTML = "Bar Plot";
        btn2.innerHTML = "Pie Plot";
        btn3.innerHTML = "Export Pie Plot";

    }
    if(plots == 0){
        btn1.innerHTML = "Scatter Plot";
        btn2.style.visibility = "hidden";
        btn3.innerHTML = "Export Scatter Plot"
    }

    btn1fn();

    console.log(row,column,plot)

    
    // btn1.addEventListener("click" , () => {
    //     document.getElementById('showPlot').style.display = "block";
    //     document.getElementById('showPlot1').style.display = "none";
        

    //     btn2.style.backgroundColor = '#6c757d';
    //     btn1.style.backgroundColor = '#5a6268';

    // })


    // btn2.addEventListener( "click" , () => {
    //     document.getElementById('showPlot').style.display = "none";
    //     document.getElementById('showPlot1').style.display = "block";

    //     console.log(row,column)
    //     $.ajax({ url: 'http://127.0.0.1:12345/scatter',
    //                 data: JSON.stringify({xdat: String(row), ydat: String(column)}),
    //                 type: 'POST',
    //                 dataType: "JSON",
    //                 beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
    //                 success: function(output) {
    //                 console.log(output['ans'])
    //                 urls.push(output['ans'])
    //                 }
    //         });
    //         console.log(String(urls[urls.length-1]))
    //         document.getElementById('igraph2').src =  String(urls[urls.length -1])
    //         console.log( document.getElementById('igraph2').src)
    //     btn1.style.backgroundColor = '#6c757d';
    //     btn2.style.backgroundColor = '#5a6268';
        
    // })

    

    modal.style.display = "block";
}


const btn1fn = () =>{
    document.getElementById('showPlot').style.display = "block";
    document.getElementById('showPlot1').style.display = "none";

    if(plot == 0){
        console.log("this needs to be figured out")
        $.ajax({ url: 'http://127.0.0.1:12345/scatter',
                data: JSON.stringify({xdat: String(row), ydat: String(column)}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('igraph1').src =  output['ans']
            }
        });
console.log((urls))
console.log( document.getElementById('igraph2').src)
    }else{
        $.ajax({ url: 'http://127.0.0.1:12345/bar',
                    data: JSON.stringify({xdat: String(row), ydat: String(column)}),
                    type: 'POST',
                    dataType: "JSON",
                    beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    success: function(output) {
                    console.log(output['ans'])
                    document.getElementById('igraph1').src =  output['ans']
                }
            });
        console.log((urls))
        console.log( document.getElementById('igraph1').src)

    }
        

    btn2.style.backgroundColor = '#6c757d';
    btn1.style.backgroundColor = '#5a6268';

}

const btn2fn = () =>{
    document.getElementById('showPlot').style.display = "none";
    document.getElementById('showPlot1').style.display = "block";

    console.log(row,column)
    if(plot == 0){
        $.ajax({ url: 'http://127.0.0.1:12345/scatter',
                    data: JSON.stringify({xdat: String(row), ydat: String(column)}),
                    type: 'POST',
                    dataType: "JSON",
                    beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    success: function(output) {
                    console.log(output['ans'])
                    document.getElementById('igraph2').src =  output['ans']
                }
            });
        console.log((urls))
        console.log( document.getElementById('igraph2').src)
    }

    else{
        $.ajax({ url: 'http://127.0.0.1:12345/pie',
                    data: JSON.stringify({label: String(row), value: String(column)}),
                    type: 'POST',
                    dataType: "JSON",
                    beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    success: function(output) {
                    console.log(output['ans'])
                    document.getElementById('igraph2').src =  output['ans']
                }
            });
            document.getElementById("btn3").addEventListener("click" , () => {
                $.ajax({ url: 'http://127.0.0.1:12345/piethumb',
                    data: JSON.stringify({label: String(row), value: String(column)}),
                    type: 'POST',
                    dataType: "JSON",
                    beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    success: function(output) {
                    console.log(output['ans'])
                    // document.getElementById(val).style.backgroundImage = "./" + output['ans'];
                }
                }); 
            })
            
        console.log((urls))
        console.log( document.getElementById('igraph2').src)
    }
    btn1.style.backgroundColor = '#6c757d';
    btn2.style.backgroundColor = '#5a6268';
}


// document.getElementById("btn3").addEventListener("click" , () => {
//     $.ajax({ url: 'http://127.0.0.1:12345/piethumb',
//             data: JSON.stringify({label: String(row), value: String(column)}),
//             type: 'POST',
//             dataType: "JSON",
//             beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//             success: function(output) {
//             console.log(output['ans'])
//             // document.getElementById(val).style.backgroundImage = "./" + output['ans'];
//         }
//         }); 
    

// })


mainc.innerHTML = cmessage;
velem.innerHTML = message;
helem.innerHTML = horMessage;


// window.onload = () => {
    
//     for(let i=0;i<7;++i){
//             for(let j = 0 ;j< 7;++j){
//                 if(i===j){
//                     continue;
//                 }
//                 val =  String(i) + String(j);
//                if((i==0 && j != 1 )|| (j== 0  && i!=1) || (i==1 && j!=0) || (j==1 && i!=0) ){
//                 //    console.log(val)
//                 //     console.log(document.getElementById(val))
//                     $.ajax({ url: 'http://127.0.0.1:12345/piethumb',
//                             data: JSON.stringify({label: String(i), value: String(j)}),
//                             type: 'POST',
//                             dataType: "JSON",
//                             beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                             success: function(output) {
//                             console.log(typeof(output['ans']))
//                             // document.getElementById(val).style.backgroundImage = output['ans'];
//                         }
//                     });
//                }else{
//                 // console.log(val)
//                 // console.log(document.getElementById(val))
        
        
                    // $.ajax({ url: 'http://127.0.0.1:12345/scatterthumb',
                    //         data: JSON.stringify({label: String(i), value: String(j)}),
                    //         type: 'POST',
                    //         dataType: "JSON",
                    //         beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                    //         success: function(output) {
                    //         console.log(output['ans'])
                    //         // document.getElementById(val).style.backgroundImage = "./" + output['ans'];
                    //     }
                    // });           
//                 }
//             }
//         }
// }




// const print = () => {
//     let i= 0, j = 0;
//     let elem = document.getElementById('plot');
//     let message = '';
//     let mymess = '<div class="square"></div>';
//     let blocked ='<div class="squaree"></div>'
//     for(j = 0 ; j<9 ; j++ ){
//         for(i=0 ; i<9 ; i++){
//             if(j == i){
//                 message = message.concat(blocked);
//                 continue;
//             }
//             message = message.concat(mymess);
//             console.log(message)
//         }
//         document.write('<br/>')
//     }
    
//     // console.log(message)
//     elem.innerHTML = message;
// }
// print();





// for(let i=0;i<7;++i){
//     for(let j = 0 ;j< 7;++j){
//         if(i===j){
//             continue;
//         }
//         val =  String(i) + String(j);
//        if((i==0 && j != 1 )|| (j== 0  && i!=1) || (i==1 && j!=0) || (j==1 && i!=0) ){
//         //    console.log(val)
//         //     console.log(document.getElementById(val))
//             $.ajax({ url: 'http://127.0.0.1:12345/piethumb',
//                     data: JSON.stringify({label: String(i), value: String(j)}),
//                     type: 'POST',
//                     dataType: "JSON",
//                     beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                     success: function(output) {
//                     console.log(typeof(output['ans']))
//                     document.getElementById(val).style.backgroundImage = output['ans'];
//                 }
//             });
//        }else{
//         // console.log(val)
//         // console.log(document.getElementById(val))


//             // $.ajax({ url: 'http://127.0.0.1:12345/scatterthumb',
//             //         data: JSON.stringify({label: String(i), value: String(j)}),
//             //         type: 'POST',
//             //         dataType: "JSON",
//             //         beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//             //         success: function(output) {
//             //         console.log(output['ans'])
//             //         // document.getElementById(val).style.backgroundImage = "./" + output['ans'];
//             //     }
//             // });           
//         }
//     }
// }


// image background
// cmessage = cmessage.concat(mymess2aa,i,',',j,',',0,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,tooltip,topics[i],' and ',topics[j],'"/></div>');
// tempcont.push(mymess2aa.concat(i,',',j,',',0,mymess2ab,numbermap[i],'-',numbermap[j],mymess2b,tooltip,topics[i],' and ',topics[j],'"/></div>'));

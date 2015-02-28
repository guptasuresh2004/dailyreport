(function(){
  

  app.factory('d3BarGraph', function(){
    /* Bar graph D3 js */
     
    var graphExecution = {

    InitChart : function(barData, graphname) {

    var vis = d3.select('#TodaysTaskGraph'),
    WIDTH = 700,
    HEIGHT = 400,
    MARGINS = {
      top: 40,
      right: 20,
      bottom: 40,
      left: 50
    },

    /*
    
    ADDTASK REPORT 
    x - ATtask_id
    y - time_spent
    
    Daily Status Report
    x - name
    y - TimeSpent


    */

    xRange = d3.scale.ordinal().rangeRoundBands([MARGINS.left, WIDTH - MARGINS.right], 0.3).domain(barData.map(function (d) {
      if('ATtask_id' in d){
        return d.ATtask_id;  
      }else if('name' in d){
        return d.name;
      }

    })),


    yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([0,
      d3.max(barData, function (d) {
        return Number(d.time_spent) + 2;
      })
    ]),

    xAxis = d3.svg.axis()
      .scale(xRange)
      .tickSize(1)
      .tickSubdivide(true)
      .orient("bottom");

    yAxis = d3.svg.axis()
      .scale(yRange)
      .tickSize(1)
      .orient("left")
      .tickSubdivide(true);

     
  vis.append('svg:g')
    .attr('class', 'x axis')
    .attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
    .call(xAxis)
  .selectAll("text")
    .style("font-size", "11px")
    .call(wrap, xRange.rangeBand());
 
  vis.append('svg:g')
    .attr('class', 'y axis')
    .attr('transform', 'translate(' + (MARGINS.left) + ',0)')
    .call(yAxis);

  var bar = vis.selectAll('rect')
    .data(barData)
    .enter()
    .append('rect')
    .attr('x', function (d) {
      if('ATtask_id' in d){
        return xRange(d.ATtask_id);

      }else if('name' in d){
        return xRange(d.name);
      }
    })
    .attr('y', function (d) {
      return yRange(d.time_spent);
    })
    .attr('width', xRange.rangeBand())
    .attr('height', function (d) {
      return ((HEIGHT - MARGINS.bottom) - yRange(d.time_spent));
    });

    bar.attr('fill', 'grey')
    .on('mouseover',function(d){
      d3.select(this)
        .attr('fill','blue');
    })
    .on('mouseout',function(d){
      d3.select(this)
        .attr('fill','grey');
    });

    vis.append("text")
        .attr("x", (WIDTH / 2))             
        .attr("y", 10 + (MARGINS.top / 2))
        .attr("text-anchor", "middle")  
        .style("font-size", "16px") 
        .style("text-decoration", "underline")  
        .text(graphname);

    vis.append("text")    
        .attr("class", "x label")
        .attr("text-anchor", "end")
        .attr("x", (WIDTH / 2))
        .attr("y", HEIGHT - 2)
        .text("Users");

    vis.append("text")
        .attr("class", "y label")
        .attr("text-anchor", "end")
        .attr("x", - (HEIGHT / 2.5))
        .attr("y", 10)
        .attr("dy", ".75em")
        .attr("transform", "rotate(-90)")
        .text("Total Hours Spent");
      

     function wrap(text, width) {
  text.each(function() {
    var text = d3.select(this),
        words = text.text().split(/\s+/).reverse(),
        word,
        line = [],
        lineNumber = 0,
        lineHeight = 1, // ems
        y = text.attr("y"),
        dy = parseFloat(text.attr("dy")),
        tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");

    while (word = words.pop()) {
      line.push(word);
      tspan.text(line.join(" "));
      if (tspan.node().getComputedTextLength() > width) {
        line.pop();
        tspan.text(line.join(" "));
        line = [word];
        tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
      }
    }

  });
}


    }

   

    }; // End graphExecution

  return graphExecution;

  });

  

})();


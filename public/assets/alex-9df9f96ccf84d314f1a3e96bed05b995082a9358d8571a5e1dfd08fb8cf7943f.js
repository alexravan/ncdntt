    var partial = localStorage.getItem("filter");
    console.log(partial);
    console.log(partial === "created_at");
    if (partial === "created_at") {
      $("#incidents").html('<%= escape_javascript(render ("created_at")) %>');
    }
    else if (partial === "severity") {
      $("#incidents").html('<%= escape_javascript(render ("severity")) %>');
    }
    // // defaults to created_at
    else {
      $("#incidents").html('<%= escape_javascript(render ("created_at")) %>');
    }

    

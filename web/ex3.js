function print_lis() {
    let lis = document.getElementsByTagName('li');
    let output_string = '';
    for (let i of lis) {
        output_string += i.innerText;
        output_string += '\n';
    }
    alert(output_string);
}

function print_spans() {
    let try_spans = document.getElementsByClassName('try_class');
    let output_string = '';
    for (let i of try_spans) {
        output_string += i.innerText;
        output_string += '\n';
    }
    alert(output_string);
}

function change_contents() {
    let lis = document.getElementsByTagName('li');
    for (let i of lis) {
        i.innerHTML = "Changed!";
    }
    document.getElementById('myspan').style.display = 'none';
    let buttons = document.getElementsByClassName('genericbuttons');
    for (let j of buttons) {
        j.style.visibility = 'hidden';
    }
    
}
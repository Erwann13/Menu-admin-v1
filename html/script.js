function triggerEvent(action) {
    fetch(`https://menu-staff/${action}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
        fetch(`https://menu-staff/closeMenu`, { method: 'POST' });
    }
});

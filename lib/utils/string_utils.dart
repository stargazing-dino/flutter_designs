String capitalize(String s) => (s != null && s.length > 1)
    ? s[0].toUpperCase() + s.substring(1)
    : s != null ? s.toUpperCase() : null;

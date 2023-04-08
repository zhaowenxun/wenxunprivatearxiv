import "scripts/config" as cfg;

let summary = params[0];


let title_rg = RegexCaseInsensitive(`(?P<key>(${cfg::title_rg}))`);
let summary = title_rg.replace_all(summary,"<span class=\"highlight-title\">$key</span>");

summary
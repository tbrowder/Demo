unit module Demo;

sub get-content($path, :$nlines = 0) is export {
    my $s = $?DISTRIBUTION.content($path).open.slurp;
    if $nlines {
        my @lines = $s.lines;
        my $nl = @lines.elems;
        if $nl >= $nlines {
            $s.lines[0..$nlines-1].join("\n");
        }
        else {
            $s;
        }
    }
    else {
        $s
    }
}

sub get-resource($path) is export {
    %?RESOURCES{$path}.slurp;
}



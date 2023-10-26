unit module Demo;

sub get-content($path, :$nlines = 0) is export {
    my $exists = resource-exists $path;
    unless $exists { return 0; }

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

sub resource-exists($path? --> Bool) is export {
    return False if not $path.defined;

    my $exists = $?DISTRIBUTION.content($path); # may die
    return True if $exists;
}

{
    my $return = resource-exists;
    say "Returned $return";
    CATCH {
        default {
            say "Error ", .^name, ': ',.Str;
            $return = False;
            .resume;
        }
    }
}

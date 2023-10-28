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

=begin comment
# doesn't work
sub file-exists($file) is export {
    # check %?RESOURCES.keys
    my $f = $file.IO.basename;
    my @res;
    for %?RESOURCES.keys {
        note "DEBUG: $_";
        when /$f/ {
           @res.push: $_;
        }
    }
    @res
}
=end comment

sub get-resource($path) is export {
    %?RESOURCES{$path}.slurp;
}

sub resource-exists($path? --> Bool) is export {
    return False if not $path.defined;

    # from Nick
    return so try $?DISTRIBUTION.content($path).open(:r).close; # may die

    =begin comment
    my $exists = $?DISTRIBUTION.content($path); # may die
    return True if $exists;
    =end comment
}

=finish

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

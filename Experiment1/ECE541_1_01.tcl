set ns [new Simulator]

set nf [open ECE541_01_a.nam w]
set all_trace [open ECE541_01_a.tr w]
$ns namtrace-all $nf
$ns trace-all $all_trace

proc finish {} {

	global ns nf all_trace
	$ns flush-trace
	close $nf
	close $all_trace
	exec nam ECE541_01_a.nam &
	exit 0

}

set n0 [$ns node]
set n1 [$ns node]


$ns duplex-link $n0 $n1 0.1Mb 10ms DropTail


set udp0 [new Agent/CBR]
$ns attach-agent $n0 $udp0
set null0 [new Agent/Null]
$ns attach-agent $n1 $null0

$ns connect $udp0 $null0

$ns at 0 "$udp0 start"
$ns at 10 "finish"

$ns run 

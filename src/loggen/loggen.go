// loggen
//
// Author:  Ondrej Sika <ondrej@ondrejsika.com>
// Source:  https://github.com/ondrejsika/git-wip
// License: MIT
//

package main

import (
	"flag"
	"fmt"
	"math/rand"
	"time"
)

func main() {
	sleepTime := flag.Int("sleep-time", 1000, "prefix for fmt, default loggen")
	noDebug := flag.Bool("no-debug", false, "don't generate DEBUG log messages")
	noInfo := flag.Bool("no-info", false, "don't generate INFO log messages")
	noWarn := flag.Bool("no-warn", false, "don't generate WARN log messages")
	noError := flag.Bool("no-error", false, "don't generate ERROR log messages")

	flag.Parse()

	// Log to logFile or STDOUT
	for {
		time.Sleep(time.Duration(*sleepTime) * time.Millisecond)

		randomNumber := rand.Intn(100)
		if randomNumber > 90 && !*noError {
			fmt.Println("{\"level\":\"ERROR\",\"message\": \"An error is usually an exception that has been caught and not handled.\"}")
			continue
		}
		if randomNumber > 70 && !*noWarn {
			fmt.Println("{\"level\":\"WARN\",\"message\": \"A warning that should be ignored is usually at this level and should be actionable.\"}")
			continue
		}
		if randomNumber > 30 && !*noInfo {
			fmt.Println("{\"level\":\"INFO\",\"message\": \"This is less important than debug log and is often used to provide context in the current task.\"}")
			continue
		}
		if !*noDebug {
			fmt.Println("{\"level\":\"DEBUG\",\"message\": \"This is a debug log that shows a log that can be ignored.\", \"foo\": 1, \"bar\": 44}")
			continue
		}
	}
}

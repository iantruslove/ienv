{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :plugins [[lein-pprint "1.1.1"]
                  [lein-bikeshed "0.2.0"]
                  [lein-auto "0.1.2"]
                  [lein-ancient "0.6.7"
                   :exclusions [com.fasterxml.jackson.dataformat/jackson-dataformat-smile
                                org.clojure/clojure
                                cheshire com.fasterxml.jackson.core/jackson-core]]
                  [jonase/eastwood "0.2.3"]]

        :source-paths ["/Users/ian/.lein/src"]

        :injections [;; humane-test-output makes clojure.test output more better
                     ;; ...except when it's dealing with doubles...
                     ;; (require 'pjstadig.humane-test-output)
                     ;; (pjstadig.humane-test-output/activate!)

                     ;; Spyscope is for tracing.
                     ;;(require 'spyscope.core)
                     ]

        :dependencies [[org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/tools.trace "0.7.8"]
                       [pjstadig/humane-test-output "0.8.0"]
                       [evalive "1.1.0"]
                       [slamhound "1.5.5"]
                       [spyscope "0.1.5"]]

        :repl {:plugins [[cider/cider-nrepl "0.13.0"]
                         [refactor-nrepl "2.2.0"]]}}}

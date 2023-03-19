podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: gradle
        image: gradle:jdk8
        command:
        - sleep
        args:
        - 99d
      restartPolicy: Never
''') {
  node(POD_LABEL) {
    stage('Calculator Acceptance Testing') {
      git 'https://github.com/dlambrig/Continuous-Delivery-with-Docker-and-Jenkins-Second-Edition.git'
      container('gradle') {

        stage('Build calculator') {
          sh '''
          cd Chapter09/sample3
          chmod +x gradlew
          ./gradlew build
          '''
        }

        // stage('start calculator') {
        //     sh '''
        //     cd Chapter08/sample1
        //     curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        //     chmod +x ./kubectl
        //     ./kubectl apply -f calculator.yaml
        //     ./kubectl apply -f hazelcast.yaml
        //     '''
        // }

        stage('acceptance test') {
          sh '''
          cd Chapter09/sample3
          chmod +x gradlew
          ./gradlew acceptanceTest -Dcalculator.url=http://$CALCIP8080
          '''

          publishHTML(target: [
            reportDir: 'Chapter09/sample3/build/reports/tests/acceptanceTest',
            reportFiles: 'index.html',
            reportName: "Acceptance Test"
          ])
        }
      }
    }
  }
}
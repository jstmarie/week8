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

        stage('acceptance test') {
          sh '''
          cd Chapter09/sample3
          chmod +x gradlew
          ./gradlew acceptanceTest -Dcalculator.url=http://calculator-service:8080
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
def env = System.getenv()

def GIT_URL = env['GIT_URL']
def GIT_BRANCH = env['GIT_BRANCH']
def jenkinsfile = 'jobs/pipeline-gnome/Jenkinsfile'

pipelineJob("pipeline-gnome") {
    parameters {
        stringParam("GIT_URL", GIT_URL)
        stringParam("GIT_BRANCH", GIT_BRANCH)
    }
    definition {
        cps {
            sandbox()
            script(
              readFileFromWorkspace(jenkinsfile)
            )
        }
    }
}

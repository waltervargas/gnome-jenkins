def env = System.getenv()

GIT_URL = env['GIT_URL']
GIT_BRANCH = env['GIT_BRANCH']

def job = job('load-jobs') {
    description('Execute this job to load the jobs declared under folder jobs/')
    scm {
      git(GIT_URL, GIT_BRANCH)
    }
    steps {
        dsl {
          external "jobs/**/*.groovy"
        }
    }
}

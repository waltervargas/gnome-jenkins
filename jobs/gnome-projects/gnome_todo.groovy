def project = [
  name: "gnome-todo"
  git_url: "https://github.com/waltervargas/gnome-todo",
]

multibranchPipelineJob(project.name) {
  logRotator(numToKeep = 200)
  // triggers {
  //   scm('H * * * *')
  // }
  branchSources {
    git {
      remote(project.git_url)
    }
  }
}

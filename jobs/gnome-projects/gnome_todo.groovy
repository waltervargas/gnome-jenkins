def project = [
  name: "gnome-todo",
  git_url: "https://github.com/waltervargas/gnome-todo"
]

multibranchPipelineJob(project.name) {
  branchSources {
    git {
      remote(project.git_url)
    }
  }
}

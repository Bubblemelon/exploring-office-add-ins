# exploring-office-add-ins
Experimenting with Microsoft Office Add-ins e.g. OneNote 

### Notes on Dockerfile

Guide on how to resolve npm EACESS Error:
[Fixing Permission Errors](https://docs.npmjs.com/getting-started/fixing-npm-permissions)

The above guide may have solved the issues with EACESS without needing to switch users. Refer to Dockerfile for more comments on the commands. 

**References**
- Using the [pipe symbol in Docker RUN](https://stackoverflow.com/questions/30441178/how-to-use-pipesioredirection-in-dockerfile-run)
- Using [Docker USER](https://docs.docker.com/engine/reference/builder/#user)
- [node:latest usage doc](https://github.com/nodejs/docker-node/blob/master/README.md#how-to-use-this-image)
- [yo office doc](https://github.com/OfficeDev/generator-office)
- [What does npm --save do](https://stackoverflow.com/questions/19578796/what-is-the-save-option-for-npm-install)
- [OneNote Add-in Tutorial](https://docs.microsoft.com/en-us/office/dev/add-ins/onenote/onenote-add-ins-getting-started)

**External Dependencies**
- [Markdown-it](https://github.com/markdown-it/markdown-it)
- [Mircosoft Add-ins Project Generator](https://github.com/OfficeDev/generator-office)


### Building + Running

```bash
docker build -t onenote-dev .
docker run -it --rm --entrypoint /bin/sh --name onenote onenote-dev
```

//파일첨부시 리스트 작성
var input = document.querySelector('#image_uploads');
var preview = document.querySelector('.preview');

function updateImageDisplay() {
  while(preview.firstChild) {
    preview.removeChild(preview.firstChild);
  }

 const curFiles = input.files;
 if(curFiles.length === 0) {
    const para = document.createElement('p');
    para.textContent = 'No files currently selected for upload';
    preview.appendChild(para);
  } else {
    const list = document.createElement('ol');
    preview.appendChild(list);

    for(const file of curFiles) {
      const listItem = document.createElement('li');
      const para = document.createElement('p');
      if(validFileType(file)) {
        para.textContent = `File name ${file.name}, file size ${returnFileSize(file.size)}.`;
        const image = document.createElement('img');
        image.src = URL.createObjectURL(file);

        listItem.appendChild(image);
        listItem.appendChild(para);
      } else {
        para.textContent = `File name ${file.name}: Not a valid file type. Update your selection.`;
        listItem.appendChild(para);
      }

      list.appendChild(listItem);
    }
  }
}

const fileTypes = [
	  "image/apng",
	  "image/bmp",
	  "image/gif",
	  "image/jpeg",
	  "image/pjpeg",
	  "image/png",
	  "image/svg+xml",
	  "image/tiff",
	  "image/webp",
	  "image/x-icon"
	];

function validFileType(file) {
	  return fileTypes.includes(file.type);
};
function returnFileSize(number) {
		  if(number < 1024) {
		    return number + 'bytes';
		 } else if(number >= 1024 && number < 1048576) {
		    return (number/1024).toFixed(1) + 'KB';
		 } else if(number >= 1048576) {
		    return (number/1048576).toFixed(1) + 'MB';
		 }
};
input.addEventListener('change', updateImageDisplay);

// 글자수를 세기(100자 제한)
const write = document.querySelector('#review_write');
const writelength = document.querySelector('#writelength');
write.addEventListener('input',()=>{
	const length = write.value.length
	writelength.innerText = length +"/100";
	if(length>100){
		write.value = write.value.substring(0,100);
		alert('100자 미만으로 작성하세요')
		writelength.innerText = "100/100"
	}
})


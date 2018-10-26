let pollingTimeout;

const meetupTemplate = (name, category, status, location, image, link) =>
	`<div class="meetup-card">
    <div class="thumb" style="background-image: url(${image})"></div>
    <div class="details">
      <h3>
        <a href="${link}">${name}</a>
      </h3>
      <p>${category}, ${status}</p>
      <p>${location}</p>
    </div>
  </div>`;

const pollRequest = () => {
	let query = $('#query').val();

	$.ajax({
		url: `/polling?query=${query}`,
		success(res) {
			if (res !== null) {
				if (res.length > 0) {
					$('#result').html('');
					res.forEach(meetup => {
						$('#result').append(
							meetupTemplate(
								meetup.name,
								meetup.meta_category.name,
								meetup.status,
								meetup.localized_location,
								(meetup.key_photo || { photo_link: 'https://via.placeholder.com/150'}).photo_link,
								meetup.link
							)
						);
					});
				} else {
					$('#result').html('No result found.');
				}
				clearTimeout(pollingTimeout);
			} else {
				pollingTimeout = setTimeout(pollRequest, 1000);
			}
		},
		error(res) {
			$('#result').html('Something went wrong. Try again.');
			clearTimeout(pollingTimeout);
		}
	});
}

function pooling() {
	$('#result').html('<p>Loading...</p>');
	pollingTimeout = setTimeout(pollRequest, 1000);
};
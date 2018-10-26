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
  let query = $("#query").val();

  $.ajax({
    url: `/polling?query=${query}`,
    success(res) {
      if (!res) return (pollingTimeout = setTimeout(pollRequest, 1000));

      if (res.length === 0) return $("#result").html("No result found.");

      $("#result").html("");

      res.forEach(meetup => {
        const {
          name,
          meta_category,
          status,
          localized_location,
          key_photo,
          link
        } = meetup;

      let photo_link = key_photo
        ? key_photo.photo_link
        : "https://via.placeholder.com/150";

      $("#result").append(
        meetupTemplate(
          name,
          meta_category.name,
          status,
          localized_location,
          photo_link,
          link
        )
      );
    });

      clearTimeout(pollingTimeout);
    },
    error() {
      $("#result").html("Something went wrong. Try again.");
      clearTimeout(pollingTimeout);
    }
  });
};

const pooling = () => {
  $("#result").html("<p>Loading...</p>");
  pollingTimeout = setTimeout(pollRequest, 1000);
};
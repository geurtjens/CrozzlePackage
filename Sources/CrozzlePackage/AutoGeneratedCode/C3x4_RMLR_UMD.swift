public class C3x4_RMLR_UMD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][3] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.Start[right1][1] &&
                                    W.Id[middley2] != W.Id[right1] &&
                                    W.Id[middley2] != W.Id[up1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for middlex2 in 0..<wordCount {

                                        if (W.Len[middlex2] == interlockWidth &&
                                            W.Start[middlex2][0] == W.End[up1][2] &&
                                            W.Start[middlex2][1] == W.Start[middley2][1] &&
                                            W.Id[middlex2] != W.Id[middley2] &&
                                            W.Id[middlex2] != W.Id[right1] &&
                                            W.Id[middlex2] != W.Id[up1]) {
                                            //print("middlex2:\(W.Start[middlex2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.Start[right1][2] &&
                                                    W.Start[down3][1] == W.Start[middlex2][2] &&
                                                    W.Id[down3] != W.Id[middlex2] &&
                                                    W.Id[down3] != W.Id[middley2] &&
                                                    W.Id[down3] != W.Id[right1] &&
                                                    W.Id[down3] != W.Id[up1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for left3 in 0..<wordCount {

                                                        if (W.Len[left3] >= interlockWidth &&
                                                            W.End[left3][2] == W.End[up1][1] &&
                                                            W.End[left3][1] == W.Start[middley2][2] &&
                                                            W.End[left3][0] == W.Start[down3][2] &&
                                                            W.Id[left3] != W.Id[down3] &&
                                                            W.Id[left3] != W.Id[middlex2] &&
                                                            W.Id[left3] != W.Id[middley2] &&
                                                            W.Id[left3] != W.Id[right1] &&
                                                            W.Id[left3] != W.Id[up1]) {
                                                            //print("left3:\(W.Start[left3])")

                                                            for right4 in 0..<wordCount {

                                                                if (W.Len[right4] >= interlockWidth &&
                                                                    W.Start[right4][0] == W.End[up1][0] &&
                                                                    W.Start[right4][1] == W.Start[middley2][3] &&
                                                                    W.Start[right4][2] == W.Start[down3][3] &&
                                                                    W.Id[right4] != W.Id[left3] &&
                                                                    W.Id[right4] != W.Id[down3] &&
                                                                    W.Id[right4] != W.Id[middlex2] &&
                                                                    W.Id[right4] != W.Id[middley2] &&
                                                                    W.Id[right4] != W.Id[right1] &&
                                                                    W.Id[right4] != W.Id[up1]) {
                                                                    //print("right4:\(W.Start[right4])")

                                                                    if phase == 0 {
                                                                        shapeCount += 1
                                                                    }
                                                                    else {
                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, middlex2, left3, right4, up1, middley2, down3])
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.trailing, .middle, .leading, .trailing],
            patternVertical: [.leading, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}